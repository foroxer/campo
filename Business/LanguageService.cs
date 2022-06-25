using DataAccess;
using Models.language;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Business
{
    public class LanguageService
    {
        private LanguageRepository languageRepository;
        public LanguageService()
        {
            languageRepository = new LanguageRepository();
        }
        public List<Language> GetLanguagesForCombo()
        {
            return languageRepository.GetAllLanguagesWithoutTranslations();
        }   

        public Language GetLanguage(string key)
        {
            return languageRepository.GetLanguage(key);
        }


    }
}
