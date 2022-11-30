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
    public  class VentaService : IDVService
    {
        private VentaRepository ventaRepository = new VentaRepository();
        public Venta get(int id)
        {
            return new Venta();
        }

        public List<Venta> getAll()
        {
            return new List<Venta>();
        }

        public void createVenta()
        {
            Venta venta = new Venta();
            venta.total = 0;
            venta.subTotal = 0;

            venta.date = DateTime.Now;
            venta.products = new List<Product>();
            venta.user  = new Models.User();
            venta.coupon = new Coupon();
        }

        private void saveVenta()
        {

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
