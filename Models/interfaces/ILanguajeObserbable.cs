using Models.language;
using System.Collections.Generic;

namespace Models.interfaces
{
    public interface ILanguajeObserbable
    {
        List<ILanguageObserber> languageObserbers { get; set; }
        void addObserber(ILanguageObserber languageObserber);
        void removeObserber(ILanguageObserber languageObserber);
        void notifyObserbers(Language languaje);
    }
}
