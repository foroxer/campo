using Models.venta;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Coupons
{
    internal class CouponPercentageStrategy : ICouponStrategy
    {
        public Decimal calcDiscount( Decimal subtotal, Coupon coupon )
        {
            if(coupon != null && coupon.discount <= 100 && coupon.discount > 0 )
            {
                Decimal percentage = (Decimal)coupon.discount/100;
                return (Decimal)subtotal * (1 - percentage);
            }
            return subtotal;
        }
    }
}
