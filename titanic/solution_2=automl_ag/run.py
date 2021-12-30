from autogluon.tabular import TabularDataset, TabularPredictor
# train
train_data = TabularDataset('train.csv')
id, label = 'PassengerId', 'Survived'

# 注意需要丢掉id列
predictor = TabularPredictor(label=label).fit(train_data.drop(columns=[id]))



import pandas as pd
# predict
test_data = TabularDataset('test.csv')
preds = predictor.predict(test_data.drop(columns=[id]))
submission = pd.DataFrame({id:test_data[id], label:preds})
submission.to_csv('submission.csv', index=False)
