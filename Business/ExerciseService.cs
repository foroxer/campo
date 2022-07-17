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
        public void createMachineType(String name)
        {
            exerciseRepository.createMachineType(name);
        }
        public void createMuscularGroup(String name)
        {
            exerciseRepository.createMuscularGroup(name);
        }
        #endregion
        #region delete
        public void deleteMachineType(MachineType machineType)
        {
            exerciseRepository.deleteMachineType(machineType);
        }
        public void deleteMuscularGroup(MuscularGroup muscularGroup)
        {
            exerciseRepository.deleteMuscularGroup(muscularGroup);
        } 
        #endregion
    }
}
