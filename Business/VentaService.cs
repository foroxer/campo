using BitacoraLib.services;
using Business.Coupons;
using DataAccess;
using DigitosVerificadoresLib.interfaces;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.ReportingServices.ReportProcessing.OnDemandReportObjectModel;
using Models;
using Models.venta;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Paragraph = iTextSharp.text.Paragraph;

namespace Business
{
    public class VentaService : IDVService
    {
        private VentaRepository ventaRepository = new VentaRepository();
        CouponsService couponsService = new CouponsService();
        public Venta get( int id )
        {
            return new Venta();
        }

        public List<Venta> getAll()
        {
            return ventaRepository.getAll();
        }

        public Venta createPreventa( Venta preventa, string couponCode = null )
        {
            try
            {
                if ( couponCode != null )
                {
                    Coupon coupon = couponsService.get(couponCode);
                    preventa.coupon = couponsService.isValid(coupon) ? coupon : throw new Exception();
                }
            }
            catch ( Exception ex )
            {
                throw new Exception("Cupon no valido");
            }

            ICouponStrategy couponStrategy;
            switch ( preventa.coupon?.type )
            {
                case CouponType.Percentage:
                    {
                        couponStrategy = new CouponPercentageStrategy();
                        break;
                    }
                case CouponType.Amount:
                    {
                        couponStrategy = new CouponAmountStrategy();
                        break;
                    }
                default:
                    {
                        couponStrategy = new CouponNoStrategy();
                        break;
                    }
            }


            Venta venta = new Venta();

            venta.subTotal = preventa.products.Sum(x => x.price);
            venta.total = couponStrategy.calcDiscount(venta.subTotal, preventa.coupon);
            venta.date = DateTime.Now;
            venta.products = preventa.products;
            venta.user = preventa.user;
            venta.coupon = preventa.coupon;
            return venta;
        }

        public Venta save( Venta venta )
        {
            return ventaRepository.saveGet(venta);
        }

        public List<String> checkintegrity()
        {
            List<String> errors = new List<string>();
            List<Venta> list = getAll();

            list.ForEach(item =>
            {
                if ( !item.dvh.Equals(ventaRepository.calculateDVH(item)) )
                {
                    errors.Add($"En la tabla Venta: El Venta con id : {item.id} , fue modificado");
                }
            });

            if ( !ventaRepository.calculateDVV(list).Equals(ventaRepository.getDVV()) )
            {
                errors.Add($"El digito verificador vertical de la tabla Venta no es correcto");
            }

            return errors;
        }

        public void reacalcDV()
        {
            ventaRepository.UpdateAllDV();
            ventaRepository.updateDVV();
        }

        public void PDF( Venta venta, string filePath )
        {
            int NumVenta = venta.id;
            string Cliente = venta.user.LastName + " " + venta.user.Name;
            string Fecha = venta.date.ToString("dd-MM-yyyy");
            decimal Total = venta.total;
            try
            {
                string fecha_final = Fecha.Replace("/", "-");
                string ruta_final = filePath;
                FileStream fs = new FileStream(ruta_final, FileMode.OpenOrCreate);

                Document doc = new Document(PageSize.A4);
                doc.SetMargins(40f, 40f, 40f, 40f);
                PdfWriter writer = PdfWriter.GetInstance(doc, fs);

                doc.Open();

                BaseFont Fuente0 = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, true);
                iTextSharp.text.Font Titulo = new iTextSharp.text.Font(Fuente0, 26f, iTextSharp.text.Font.BOLD, BaseColor.BLACK);

                BaseFont Fuente1 = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, true);
                iTextSharp.text.Font Titulo2 = new iTextSharp.text.Font(Fuente1, 18f, iTextSharp.text.Font.BOLD, BaseColor.BLACK);

                BaseFont Fuente2 = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, true);
                iTextSharp.text.Font TablasTitulo = new iTextSharp.text.Font(Fuente2, 14f, iTextSharp.text.Font.ITALIC, BaseColor.BLACK);

                BaseFont Fuente3 = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, true);
                iTextSharp.text.Font TablasTexto = new iTextSharp.text.Font(Fuente3, 12f, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);

                //iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance();
                //string imagepath = Directory.GetParent(System.IO.Directory.GetCurrentDirectory()).Parent.Parent.FullName + "\\Imagenes\\LogoTP.png";
                //iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(imagepath);
                //logo.Alignment = Element.ALIGN_CENTER;
                //logo.ScalePercent(60);
                //doc.Add(logo);

                Paragraph Venta = new Paragraph("Venta", Titulo);
                Venta.Alignment = Element.ALIGN_CENTER;
                doc.Add(Venta);
                doc.Add(new Chunk("\n"));

                Paragraph NVenta = new Paragraph("Numero de venta: " + NumVenta + "", Titulo2);
                NVenta.Alignment = Element.ALIGN_LEFT;
                doc.Add(NVenta);
                doc.Add(new Chunk("\n"));

                Paragraph ClienteN = new Paragraph("Cliente: " + Cliente + "", Titulo2);
                ClienteN.Alignment = Element.ALIGN_LEFT;
                doc.Add(ClienteN);
                doc.Add(new Chunk("\n"));

                Paragraph FechaP = new Paragraph("Fecha: " + Fecha + "", Titulo2);
                FechaP.Alignment = Element.ALIGN_LEFT;
                doc.Add(FechaP);
                doc.Add(new Chunk("\n"));

                PdfPTable table = new PdfPTable(4);
                table.AddCell(new PdfPCell(new Phrase("Cantidad", TablasTitulo)) { HorizontalAlignment = Element.ALIGN_CENTER });
                table.AddCell(new PdfPCell(new Phrase("Codigo Producto", TablasTitulo)) { HorizontalAlignment = Element.ALIGN_CENTER });
                table.AddCell(new PdfPCell(new Phrase("Descripcion", TablasTitulo)) { HorizontalAlignment = Element.ALIGN_CENTER });
                table.AddCell(new PdfPCell(new Phrase("Precio", TablasTitulo)) { HorizontalAlignment = Element.ALIGN_CENTER });

                table.SpacingBefore = 10;
                foreach ( Product product in venta.products )
                {
                    try
                    {
                        int CodProd = product.code;
                        string Descripcion = product.description;
                        string PrecioU = string.Format("{0:0.00}", product.price);
                        int Cantidad = 1;

                        table.AddCell(new PdfPCell(new Phrase(Cantidad.ToString(), TablasTexto)) { HorizontalAlignment = Element.ALIGN_CENTER, VerticalAlignment = Element.ALIGN_MIDDLE });
                        table.AddCell(new PdfPCell(new Phrase(CodProd.ToString(), TablasTexto)) { HorizontalAlignment = Element.ALIGN_CENTER, VerticalAlignment = Element.ALIGN_MIDDLE });
                        table.AddCell(new PdfPCell(new Phrase(Descripcion.ToString(), TablasTexto)) { HorizontalAlignment = Element.ALIGN_CENTER, VerticalAlignment = Element.ALIGN_MIDDLE });
                        table.AddCell(new PdfPCell(new Phrase(PrecioU.ToString(), TablasTexto)) { HorizontalAlignment = Element.ALIGN_CENTER, VerticalAlignment = Element.ALIGN_MIDDLE });
                    }
                    catch ( Exception )
                    {

                    }
                }
                if ( venta.coupon != null )
                {
                    String cuponPrice;
                    switch ( venta.coupon.type )
                    {
                        case CouponType.Percentage:
                            {
                                cuponPrice = venta.coupon.discount.ToString()+"%";
                                break;
                            }
                        case CouponType.Amount:
                            {
                                cuponPrice = "-" + string.Format("{0:0.00}", venta.coupon.discount); 
                                break;
                            }
                        default:
                            {
                                cuponPrice = "";
                                break;
                            }
                    }
                    
                    table.AddCell(new PdfPCell(new Phrase("1", TablasTexto)) { HorizontalAlignment = Element.ALIGN_CENTER, VerticalAlignment = Element.ALIGN_MIDDLE });
                    table.AddCell(new PdfPCell(new Phrase(venta.coupon.code, TablasTexto)) { HorizontalAlignment = Element.ALIGN_CENTER, VerticalAlignment = Element.ALIGN_MIDDLE });
                    table.AddCell(new PdfPCell(new Phrase("cupon", TablasTexto)) { HorizontalAlignment = Element.ALIGN_CENTER, VerticalAlignment = Element.ALIGN_MIDDLE });
                    table.AddCell(new PdfPCell(new Phrase(cuponPrice, TablasTexto)) { HorizontalAlignment = Element.ALIGN_CENTER, VerticalAlignment = Element.ALIGN_MIDDLE });

                }

                doc.Add(table);

                Paragraph Linea = new Paragraph("----------------------------", Titulo2);
                Linea.Alignment = Element.ALIGN_RIGHT;
                doc.Add(Linea);

                Paragraph TotalF = new Paragraph("El total es: " + String.Format("{0:0.00}", Total) + "", Titulo2);
                TotalF.Alignment = Element.ALIGN_RIGHT;
                doc.Add(TotalF);
                doc.Add(new Chunk("\n"));

                doc.Close();
                writer.Close();


            }
            catch ( Exception )
            {
                BitacoraService.register(BitacoraLib.entities.PriorityEnum.Medium, "errora al generar comprobante de venta", Session.GetInstance.user.Id.ToString());
                throw;

            }

        }
    }
}
