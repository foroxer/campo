using DataAccess;
using Models.bussines;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class ExerciseService
    {
        ExerciseRepository exerciseRepository;

        public ExerciseService()
        {
            exerciseRepository = new ExerciseRepository();
        }
        public List<Machine> GetAllMachinetypes()
        {
            return exerciseRepository.GetMachineTypes();
        }

        public List<MuscularGroup> GetAllMuscularGroups()
        {
            return exerciseRepository.GetMuscularGroups();
        }

        public List<Exercise> GetExercisesBy(MuscularGroup muscularGroup)
        {
            return exerciseRepository.GetExercises(muscularGroup);
        }
        public List<Exercise> GetExercisesBy(Machine machine)
        {
            return exerciseRepository.GetExercises(machine);
        }
        public List<Exercise> GetExercisesBy(Machine machine, MuscularGroup muscularGroup)
        {
            return exerciseRepository.GetExercises(machine, muscularGroup);
        }
    }
}
