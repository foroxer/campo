using DigitosVerificadoresLib.interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.venta
{
    public class Coupon : IDVEntity
    {
		private int _id;		

		public int id
		{
			get { return _id; }
			set { _id = value; }
		}

		private string _code;

		public string code
		{
			get { return _code; }
			set { _code = value; }
		}

		private DateTime _emmitDate;

		public DateTime emmitDate
        {
			get { return _emmitDate; }
			set { _emmitDate = value; }
		}

		private DateTime _expirationDate;

		public DateTime expirationDate
        {
			get { return _expirationDate; }
			set { _expirationDate = value; }
		}


		private string _type;

		public string type
		{
			get { return _type; }
			set { _type = value; }
		}

		private int _discount;

		public int discount
		{
			get { return _discount; }
			set { _discount = value; }
		}

		public string dvh { get; set ; }
	}
}
