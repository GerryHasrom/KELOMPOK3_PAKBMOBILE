import numpy as np
import tensorflow as tf
import os

class Model:
    def __init__(self, model_path=None):
        if model_path:
            if model_path.endswith('.h5'):
                self.model = tf.keras.models.load_model(model_path)
                self.model_type = 'keras'
            else:
                raise ValueError(f"Model format '{model_path.split('.')[-1]}' tidak didukung.")
        else:
            self.model = None

    def recommend_workout_based_on_calories(self, calories_input, workout_type):
        '''
        Fungsi ini digunakan untuk merekomendasikan jumlah latihan dan kategori berdasarkan jumlah kalori yang ingin dibakar.
        Input: calories_input - jumlah kalori yang ingin dibakar oleh pengguna.
        Output: kategori latihan dan jumlah latihan yang sesuai.
        '''
        # Menentukan kategori latihan dan jumlah latihan berdasarkan kalori yang dibakar
        category, num_exercises = self.get_workout_category_and_exercises(calories_input)
        
        # Menambahkan atribut tambahan untuk setiap latihan
        workout_data = self.get_workout_details(workout_type, category, num_exercises)
        
        return category, num_exercises, workout_data

    def get_workout_category_and_exercises(self, calories_input):
        '''
        Menentukan kategori latihan dan jumlah latihan berdasarkan kalori yang dibakar
        '''
        if calories_input < 200:
            category = "Pemula"
            num_exercises = 2  
        elif 200 <= calories_input < 500:
            category = "Menengah"
            num_exercises = 4  
        else:
            category = "Expert"
            num_exercises = 6 + (calories_input - 500) // 200 

        return category, num_exercises

    def get_workout_details(self, workout_type, category, num_exercises):
        '''
        Menyediakan atribut tambahan seperti Max_BPM, Avg_BPM, Resting_BPM, Session_Duration, Calories_Burned, Fat_Percentage, Water_Intake
        berdasarkan kategori dan tipe latihan.
        '''
        # Menentukan nama latihan berdasarkan tipe workout
        workout_names = self.get_workout_names(workout_type, num_exercises)
        
        # Base values yang digunakan untuk semua jenis latihan
        base_max_bpm = 150 if workout_type == 0 else 130 if workout_type == 1 else 120
        avg_bpm_factor = 0.75 if workout_type == 0 else 0.65  
        base_duration = 15  
        duration_factor = 5  
        calorie_factor = 40  
        fat_burn_factor = 1  
        base_water_intake = 2  
        water_intake_factor = 0.3  
        
        workout_details = []
        for i, exercise in enumerate(workout_names):
            # Kalkulasi atribut latihan dengan mempertimbangkan indeks latihan (i)
            max_bpm = base_max_bpm + i  # Tambahkan i untuk membuat max_bpm bervariasi antar latihan
            avg_bpm = max_bpm * avg_bpm_factor  # Avg BPM adalah faktor dari max BPM
            session_duration = base_duration + (i * duration_factor)  # Durasi bertambah untuk setiap latihan
            calories_burned = calorie_factor * (i + 1)  # Kalori terbakar bertambah per latihan
            fat_percentage = 15 - (i * fat_burn_factor)  # Pengurangan lemak bertambah per latihan
            water_intake = base_water_intake + (i * water_intake_factor)  # Kebutuhan air meningkat per latihan

            workout_details.append({
                'exercise_name': exercise,
                'Max_BPM': max_bpm,
                'Avg_BPM': avg_bpm,
                'Resting_BPM': 60,  
                'Session_Duration': session_duration,
                'Calories_Burned': calories_burned,
                'Fat_Percentage': fat_percentage,
                'Water_Intake': water_intake,
            })
        
        return workout_details

    def get_workout_names(self, workout_type, num_exercises):
        '''
        Menyediakan nama latihan berdasarkan tipe workout dan jumlah latihan
        '''
        cardio_exercises = ["Lari", "Sepeda", "Ski Erg", "Berjalan Cepat", "Jumping Jack", "Mountain Climbers", "Forward Scissor"]
        hiit_exercises = ["Burpees", "Jump Squats", "Push-ups", "Plank", "Jumping Lunges", "Box Jumps", "Tuck Jumps"]
        strength_exercises = ["Squats", "Deadlifts", "Push-ups", "Lunges", "Pull-ups", "Bicep Curls", "Chest Press"]
        yoga_exercises = ["Downward Dog", "Child's Pose", "Warrior One", "Tree Pose", "Cobra Pose", "Crescew Moon Pose", "Pyramid Pose"]

        # Pilih latihan berdasarkan workout type
        if workout_type == 0:  # Cardio
            return cardio_exercises[:num_exercises]
        elif workout_type == 1:  # HIIT
            return hiit_exercises[:num_exercises]
        elif workout_type == 2:  # Strength
            return strength_exercises[:num_exercises]
        elif workout_type == 3:  # Yoga
            return yoga_exercises[:num_exercises]
        else:
            return []
