using Business.Coupons;
using DataAccess;
using DigitosVerificadoresLib.interfaces;
using Models.venta;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
            return new List<Venta>();
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

        public void save( Venta venta )
        {
            ventaRepository.save(venta);
        }

        public List<String> checkintegrity()
        {
            List<String> errors = new List<string>();
            List<Venta> list = ventaRepository.getAll();

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
        }
    }
}
