using DataAccess;
using Models;
using Models.bussines;
using System;
using System.Collections.Generic;
using System.Data;
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
            return exerciseRepository.GetExercisesBy(muscularGroup);
        }
        public List<Exercise> GetExercisesBy(MachineType machine)
        {
            return exerciseRepository.GetExercisesBy(machine);
        }
        public List<Exercise> GetExercisesBy(MachineType machine, MuscularGroup muscularGroup)
        {
            return exerciseRepository.GetExercisesBy(machine, muscularGroup);
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
        public void CreateExercise(Exercise exercise)
        {
            CreateExercise(exercise.MachineType, exercise.MuscularGroup, exercise.Description);
        }
        public void CreateExercise(MachineType machine, MuscularGroup muscularGroup, String description)
        {
            exerciseRepository.CreateExercise(machine, muscularGroup, description);
        }
        #endregion
        #region delete
        public void DeleteMachineType(MachineType machineType)
        {
            List<Exercise> exercises = exerciseRepository.GetExercisesBy(machineType);
            foreach (Exercise exercise in exercises)
            {
                exerciseRepository.DeleteExercise(exercise);
            }
            exerciseRepository.DeleteMachineType(machineType);
        }
        public void DeleteMuscularGroup(MuscularGroup muscularGroup)
        {
            List<Exercise> exercises = exerciseRepository.GetExercisesBy(muscularGroup);
            foreach(Exercise exercise in exercises)
            {
                exerciseRepository.DeleteExercise(exercise);
            }
            exerciseRepository.DeleteMuscularGroup(muscularGroup);
        } 
        public void DeleteExercise(Exercise exercise)
        {
            exerciseRepository.DeleteExercise(exercise);
        } 
        #endregion

        public void AssingMuscularGroup(User user, MuscularGroup muscularGroup, int repetitions = 1, double weight = 0)
        {
            exerciseRepository.AssingMuscularGroup(user, muscularGroup, repetitions, weight);
        }
        public DataSet GetAssignedMuscularGroupBy(int userId)
        {
           return exerciseRepository.GetAssignedMuscularGroupBy(userId);
        }

        public void UnassingMuscularGroup(int UserId, int muscularGroupId)
        {
            exerciseRepository.UnassingMuscularGroup(UserId, muscularGroupId);
        }
    }
}
