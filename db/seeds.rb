q1 = Question.create!(text: "How active is your lifestyle?")
q2 = Question.create!(text: "Do you live in a house or an apartment?")
q3 = Question.create!(text: "How much time can you devote to a pet daily?")
q4 = Question.create!(text: "Do you have children or other pets?")
q5 = Question.create!(text: "Why do you want a pet?")
q6 = Question.create!(text: "How often do you travel?")
q7 = Question.create!(text: "What is your monthly budget for a pet?")
q8 = Question.create!(text: "How comfortable are you with grooming and cleanup?")
q9 = Question.create!(text: "What's your daily schedule like?")
q10 = Question.create!(text: "What kind of temperament are you looking for in a pet?")

a1_a = Answer.create!(question: q1, text: "Very active (hiking, running daily)")
a1_b = Answer.create!(question: q1, text: "Moderately active (walks, occasional activity)")
a1_c = Answer.create!(question: q1, text: "Not very active (sedentary, homebody)")
a2_a = Answer.create!(question: q2, text: "House with yard")
a2_b = Answer.create!(question: q2, text: "Apartment")
a2_c = Answer.create!(question: q2, text: "Small, shared space")
a3_a = Answer.create!(question: q3, text: "More than 3 hours/day")
a3_b = Answer.create!(question: q3, text: "1-3 hours/day")
a3_c = Answer.create!(question: q3, text: "Less than 1 hour/day")
a4_a = Answer.create!(question: q4, text: "Yes, children under 10")
a4_b = Answer.create!(question: q4, text: "Yes, I have a cat (not declawed)")
a4_c = Answer.create!(question: q4, text: "Yes, I have a declawed cat")
a4_d = Answer.create!(question: q4, text: "Yes, I have a friendly, social dog")
a4_e = Answer.create!(question: q4, text: "Yes, I have a dog and they prefer their space (senior dog, reactive dogs)")
a4_f = Answer.create!(question: q4, text: "No")
a5_a = Answer.create!(question: q5, text: "Companionship/cuddle buddy")
a5_b = Answer.create!(question: q5, text: "Aesthetics/decoration")
a5_c = Answer.create!(question: q5, text: "Teach children responsibility")
a6_a = Answer.create!(question: q6, text: "1-3 weeks/year")
a6_b = Answer.create!(question: q6, text: "4-6 weeks/year")
a6_c = Answer.create!(question: q6, text: "6+ weeks/year")
a7_a = Answer.create!(question: q7, text: "Less than $50")
a7_b = Answer.create!(question: q7, text: "$50-100")
a7_c = Answer.create!(question: q7, text: "$100+")
a8_a = Answer.create!(question: q8, text: "Fine with regular grooming/maintenance")
a8_b = Answer.create!(question: q8, text: "Prefer low maintenance pets")
a8_c = Answer.create!(question: q8, text: "Allergic/sensitive to odor")
a9_a = Answer.create!(question: q9, text: "Home most of the day (remote work, retired)")
a9_b = Answer.create!(question: q9, text: "Gone during typical work hours (9-5)")
a9_c = Answer.create!(question: q9, text: "Irregular schedule (freelance)")
a10_a = Answer.create!(question: q10, text: "Laid-back, chill")
a10_b = Answer.create!(question: q10, text: "Playful and energetic")
a10_c = Answer.create!(question: q10, text: "Independent")
a10_d = Answer.create!(question: q10, text: "Affectionate and cuddly")

golden_retriever = RecommendedAnimal.create!(type: "golden_retriever")
corgi = RecommendedAnimal.create!(type: "corgi")
border_collie = RecommendedAnimal.create!(type: "border_collie")
mastiff = RecommendedAnimal.create!(type: "mastiff")
dachshund = RecommendedAnimal.create!(type: "dachshund")
basset_hound = RecommendedAnimal.create!(type: "golden_retriever")
cat = RecommendedAnimal.create!(type: "cat")
small_mammal = RecommendedAnimal.create!(type: "small_mammal")
bird = RecommendedAnimal.create!(type: "bird")
amphibian_fish_reptile = RecommendedAnimal.create!(type: "amphibian_fish_reptile")
tamagotchi = RecommendedAnimal.create!(type: "tamagotchi")











