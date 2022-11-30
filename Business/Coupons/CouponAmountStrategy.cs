using Models.venta;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Coupons
{
    public class CouponAmountStrategy : ICouponStrategy
    {
        public Decimal calcDiscount( Decimal subtotal, Coupon coupon )
        {
            if ( coupon != null && coupon.discount > 0 )
            {
                Decimal total = subtotal - (Decimal)coupon.discount;
                return total <= 0 ? 0 : total;
            }
            return subtotal;
        }
    }
}
