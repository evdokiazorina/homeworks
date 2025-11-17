import pandas as pd
import os

input_dir = 'input'
output_dir = 'output'

df_meta = pd.read_csv(os.path.join(input_dir, 'sample_metadata.csv'))
df_mass = pd.read_csv(os.path.join(input_dir, 'mass_spec_results.csv'))
df_quality = pd.read_csv(os.path.join(input_dir, 'quality_data.csv'))

# inner join
df_inner = pd.merge(df_meta, df_mass, on='sample_id', how='inner')
df_inner_final = pd.merge(df_inner, df_quality, on='sample_id', how='inner')
df_inner_final.to_csv(os.path.join(output_dir, 'joined_data_inner.csv'), index=False)

# left join
df_left = pd.merge(df_meta, df_mass, on='sample_id', how='left')
df_left_final = pd.merge(df_left, df_quality, on='sample_id', how='left')
df_left_final.to_csv(os.path.join(output_dir, 'joined_data_left.csv'), index=False)

# right join
df_right = pd.merge(df_meta, df_mass, on='sample_id', how='right')
df_right_final = pd.merge(df_right, df_quality, on='sample_id', how='right')
df_right_final.to_csv(os.path.join(output_dir, 'joined_data_right.csv'), index=False)

# outer join
df_outer = pd.merge(df_meta, df_mass, on='sample_id', how='outer')
df_outer_final = pd.merge(df_outer, df_quality, on='sample_id', how='outer')
df_outer_final.to_csv(os.path.join(output_dir, 'joined_data_outer.csv'), index=False)