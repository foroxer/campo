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
    public class ProductService : IDVService
    {
        private ProductRepository productRepository = new ProductRepository();

        public List<String> checkintegrity()
        {
            List<String> errors = new List<string>();
            List<Product> list = productRepository.getAll();

            list.ForEach(item =>
            {
                if ( !item.dvh.Equals(productRepository.calculateDVH(item)) )
                {
                    errors.Add($"En la tabla Producto: El Producto con id : {item.id} , fue modificado");
                }
            });

            if ( !productRepository.calculateDVV(list).Equals(productRepository.getDVV()) )
            {
                errors.Add($"El digito verificador vertical de la tabla Producto no es correcto");
            }

            return errors;
        }

        public List<Product> getAll()
        {
            return productRepository.getAll();
        }
        public void reacalcDV()
        {
            productRepository.UpdateAllDV();
        }
    }
}
