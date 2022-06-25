using Models.language;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.interfaces
{
    public interface ILanguageObserber
    {
        void updateLanguage(Language language);
    }
}
