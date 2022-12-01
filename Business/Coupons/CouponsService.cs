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
    public class CouponsService: IDVService
    {
        CouponRepository couponRepository =new CouponRepository();
        public Coupon get(int id )
        {
           return couponRepository.get(id);   
        }

        public Coupon get( string code )
        {
            return couponRepository.get(code);
        }

        public List<Coupon> getAll( )
        {
            return couponRepository.getAll();
        }

        public Coupon create( Coupon coupon)
        {
            if( coupon.discount == 0 )
            {
                throw new Exception("Error al crear un cupon");
            }

            couponRepository.save(coupon);

            return couponRepository.get(coupon.code);
        }

        public Boolean isValid( Coupon coupon )
        {
            try
            {
                return coupon.expirationDate.Ticks > DateTime.Now.Ticks;
            }
            catch ( Exception )
            {
                return false;
            }
        }
        public Coupon update( Coupon coupon)
        {
            if( coupon.discount == 0 )
            {
                throw new Exception("Error al actualizar un cupon");
            }

            couponRepository.update(coupon);

            return couponRepository.get(coupon.code);
        }

        public List<String> checkintegrity()
        {
            List<String> errors = new List<string>();
            List<Coupon> list = couponRepository.getAll();

            list.ForEach(item =>
            {
                if ( !item.dvh.Equals(couponRepository.calculateDVH(item)) )
                {
                    errors.Add($"En la tabla Cupon: El Cupon con id : {item.id} , fue modificado");
                }
            });

            if ( !couponRepository.calculateDVV(list).Equals(couponRepository.getDVV()) )
            {
                errors.Add($"El digito verificador vertical de la tabla Cupon no es correcto");
            }

            return errors;
        }

        public void reacalcDV()
        {
            couponRepository.UpdateAllDV();
            couponRepository.updateDVV();
        }
    }
}
