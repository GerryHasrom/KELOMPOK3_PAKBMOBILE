import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from api.model.inference import Model

model = Model('api/model/garden/calories_burned_model.h5')

@csrf_exempt
def predict(request):
    if request.method == 'POST':
        try:
            # Mengambil data dari request body
            data_request = json.loads(request.body)
            print(f"Data received: {data_request}")
            calories_input = data_request.get('calories_burned')
            workout_type = data_request.get('workout_type')

            # Validasi data pengguna
            if calories_input is None or workout_type is None:
                return JsonResponse({'error': 'Tidak ada data yang diberikan'}, status=400)

            if workout_type not in [0, 1, 2, 3]:
                return JsonResponse({'error': 'Jenis workout tidak valid (0, 1, 2, 3)'}, status=400)

            # Mendapatkan kategori latihan dan jumlah latihan berdasarkan input kalori dan workout_type
            workout_category, num_exercises, workout_data = model.recommend_workout_based_on_calories(calories_input, workout_type)

            # Tentukan nama jenis latihan berdasarkan workout_type
            workout_type_mapping = {
                0: "Cardio",
                1: "HIIT",
                2: "Strength",
                3: "Yoga"
            }

            workout_type_name = workout_type_mapping.get(workout_type, "Unknown")

            # Mengembalikan response
            return JsonResponse({
                'message': 'Prediksi berhasil',
                'calories_burned': calories_input,
                'workout_type': workout_type_name, 
                'recommended_workout': workout_category,  
                'number_of_exercises': num_exercises,  
                'workout_details': workout_data  
            }, status=200)

        except json.JSONDecodeError:
            return JsonResponse({'error': 'Format JSON tidak valid'}, status=400)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    else:
        return JsonResponse({'error': 'Endpoint ini hanya mendukung request POST.'}, status=405)
