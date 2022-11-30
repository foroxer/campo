using DigitosVerificadoresLib.interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.venta
{
    public class Venta : IDVEntity
    {
        private int _id;

        public int id
        {
            get { return _id; }
            set { _id = value; }
        }

        private List<Product> _products = new List<Product>();

        public List<Product> products
        {
            get { return _products; }
            set { _products = value; }
        }

        private DateTime _date;

        public DateTime date
        {
            get { return _date; }
            set { _date = value; }
        }

        private User _user;

        public User user
        {
            get { return _user; }
            set { _user = value; }
        }

        private Coupon _coupon;

        public Coupon coupon
        {
            get { return _coupon; }
            set { _coupon = value; }
        }

        private Decimal _subTotal;

        public Decimal subTotal
        {
            get { return _subTotal; }
            set { _subTotal = value; }
        }

        private Decimal _total;

        public Decimal total
        {
            get { return _total; }
            set { _total = value; }
        }

        public string dvh { get; set; }
    }
}
