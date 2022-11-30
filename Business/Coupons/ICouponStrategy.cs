using Models.venta;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Coupons
{
    public  interface ICouponStrategy
    {
        Decimal calcDiscount( Decimal subtotal ,Coupon coupon );
    }
}
