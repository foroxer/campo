using DataAccess;
using Models.language;
using System.Collections.Generic;



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
