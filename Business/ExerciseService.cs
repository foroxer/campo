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

        #region lists
        public List<MachineType> GetAllMachineTypes()
        {
            return exerciseRepository.GetMachineTypes();
        }
        public List<MuscularGroup> GetAllMuscularGroups()
        {
            return exerciseRepository.GetMuscularGroups();
        }
        public List<Exercise> GetAllExercises() {
            return exerciseRepository.GetAllExercises();
        }
        public List<Exercise> GetExercisesBy(MuscularGroup muscularGroup)
        {
            return exerciseRepository.GetExercises(muscularGroup);
        }
        public List<Exercise> GetExercisesBy(MachineType machine)
        {
            return exerciseRepository.GetExercises(machine);
        }
        public List<Exercise> GetExercisesBy(MachineType machine, MuscularGroup muscularGroup)
        {
            return exerciseRepository.GetExercises(machine, muscularGroup);
        }
        #endregion
        #region create
        public void CreateMachineType(String name)
        {
            exerciseRepository.CreateMachineType(name);
        }
        public void CreateMuscularGroup(String name)
        {
            exerciseRepository.CreateMuscularGroup(name);
        }
        #endregion
        #region delete
        public void DeleteMachineType(MachineType machineType)
        {
            exerciseRepository.DeleteMachineType(machineType);
        }
        public void DeleteMuscularGroup(MuscularGroup muscularGroup)
        {
            exerciseRepository.DeleteMuscularGroup(muscularGroup);
        } 
        public void DeleteExercise(Exercise exercise)
        {
            exerciseRepository.DeleteExercise(exercise);
        } 
        #endregion
    }
}
