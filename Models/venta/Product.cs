using DigitosVerificadoresLib.interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.venta
{
    public class Product :IDVEntity
    {
		private int _id;

		public int id
		{
			get { return _id; }
			set { _id = value; }
		}

		private int _code;

		public int code
		{
			get { return _code; }
			set { _code = value; }
		}

		private string _name;

		public string name
		{
			get { return _name; }
			set { _name = value; }
		}

		private string _description;

		public string description
		{
			get { return _description; }
			set { _description = value; }
		}

		private decimal _price;

		public decimal price
		{
			get { return _price; }
			set { _price = value; }
		}

		public string dvh { get; set ; }
	}
}
