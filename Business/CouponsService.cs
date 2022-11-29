using DataAccess;
using Models.venta;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class CouponsService
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
            Guid guid = Guid.NewGuid();
            string uuid = guid.ToString();

            coupon.code = uuid;
            couponRepository.save(coupon);

            return couponRepository.get(uuid);
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
        }
    }
}
