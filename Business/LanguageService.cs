using DataAccess;
using Models.language;
using System.Collections.Generic;



namespace Business
{
    public class LanguageService
    {
        public LanguageRepository languageRepository;
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

        public List<Language> GetLanguages()
        {
            List<Language> languages = languageRepository.GetAllLanguagesWithTranslations();
            return languages;
        }
        public object test()
        {
            return languageRepository.test();
        }
    }
}
