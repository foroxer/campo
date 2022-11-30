using Models.venta;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Coupons
{
    internal class CouponNoStrategy : ICouponStrategy
    {
        public decimal calcDiscount( decimal subtotal, Coupon coupon )
        {
            return subtotal;
        }
    }
}
