relevant_example = load("../../../Relevant_Data/0001.mat", "BW");

result = load("AlgorithmOutputSample.mat", "result");

[precision, recall, img] = test_algorithm(result.result, relevant_example.BW);

%[precision, recall, img] = test_algorithm(RetrievalData, Relevant);


fprintf("Precision: %.2f\n", precision);
fprintf("Recall: %.2f\n", recall);
