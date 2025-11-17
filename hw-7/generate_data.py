import pandas as pd
import numpy as np
import os

input_dir = 'input' #создаем папку
os.makedirs(input_dir, exist_ok=True)
np.random.seed(4)

# 2 метаданные образцов
num_samples = 15
sample_ids = [f'S{i:03d}' for i in range(1, num_samples + 1)]
metadata_data = {
    'sample_id': sample_ids,
    'patient_age': np.random.randint(20, 70, num_samples),
    'treatment_group': np.random.choice(['A', 'B', 'C'], num_samples),
}
df_meta = pd.DataFrame(metadata_data)
df_meta.to_csv(os.path.join(input_dir, 'sample_metadata.csv'), index=False)

# 3 результаты масс-спектрометрии
num_mass_spec = 12
mass_spec_ids = [f'S{i:03d}' for i in range(1, num_mass_spec + 1)]
mass_spec_data = {
    'sample_id': mass_spec_ids,
    'compound_a_concentration': np.round(np.random.rand(num_mass_spec) * 100, 2),
}
df_mass = pd.DataFrame(mass_spec_data)
df_mass.to_csv(os.path.join(input_dir, 'mass_spec_results.csv'), index=False)

# 4 данные о качестве
num_quality = 10
quality_ids = [f'S{i:03d}' for i in range(5, 5 + num_quality)] # S005 до S014
quality_data = {
    'sample_id': quality_ids,
    'quality_score': np.random.randint(75, 100, num_quality),
}
df_quality = pd.DataFrame(quality_data)
df_quality.to_csv(os.path.join(input_dir, 'quality_data.csv'), index=False)