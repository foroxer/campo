using DataAccess;
using Models.language;
using System;
using System.Collections.Generic;
using System.Data;

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

        public Language GetLanguage(string name)
        {
            return languageRepository.GetLanguage(name);
        }

        public Language GetLanguage( int id )
        {
            return languageRepository.GetLanguage(id);
        }
        public List<Language> GetLanguages()
        {
            List<Language> languages = languageRepository.GetAllLanguagesWithTranslations();
            return languages;
        }
        public DataSet GetDataSet()
        {
            return languageRepository.GetDataSet();
        }

        public Language Create(string name)
        {
            return languageRepository.CreateLanguage(name);
        }

        public void updateTranslation(string key, string value, string languajeName)
        {
            languageRepository.updateTranslation(key, value, GetLanguage(languajeName));
        }

        public void createTranslation(string key, string value, string languajeName)
        {
            languageRepository.createTranslation(key, value, GetLanguage(languajeName));
        }
    }
}
