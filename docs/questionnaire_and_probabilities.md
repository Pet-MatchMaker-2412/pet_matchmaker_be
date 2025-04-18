

1. **How active is your lifestyle?**
    
    - very active (hiking, running daily)
        
        - `{golden_retriever: 0.25, corgi: 0.25, border_collie: 0.25, bird: 0.25}`
            
    - moderately active (walks, occasional activity)
        
        - `{dachshund: 0.25, mastiff: 0.25, basset_hound: 0.25, bird: 0.25}`
            
    - not very active (sedentary, homebody)
        
        - `{cat: 0.33, small_mammal: 0.33, amphibian_fish_reptile: 0.33}`
            
2. **Do you live in a house or an apartment?**
    
    - House with yard
        
        - `{golden_retriever: 0.20, corgi: 0.20, border_collie: 0.20, bird: 0.20, mastiff: 0.20}`
            
    - Apartment
        
        - `{cat: 0.25, small_mammal: 0.25, amphibian_fish_reptile: 0.25, dachshund: 0.25}`
            
    - Small, shared space
        
        - `{cat: 0.33, small_mammal: 0.33, amphibian_fish_reptile: 0.33}`
            
3. **How much time can you devote to a pet daily?**
    
    - More than 3 hours/day
        
        - `{border_collie: 0.33, golden_retriever: 0.33, bird: 0.33}`
            
    - 1-3 hours/day
        
        - `{dachshund: 0.25, mastiff: 0.25, basset_hound: 0.25, corgi: 0.25}`
            
    - Less than 1 hour/day
        
        - `{cat: 0.33, small_mammal: 0.33, amphibian_fish_reptile: 0.33}`
            
4. **Do you have children or other pets?**
    
    - Yes, children under 10
        
        - `{small_mammal: 0.33, golden_retriever: 0.33, cat: 0.33}`
            
    - Yes, I have a cat (not declawed)
        
        - `{cat: 0.33, dachshund: 0.33, basset_hound: 0.33}`
            
    - Yes, I have a declawed cat
        
        - `{amphibian_fish_reptile: 0.25, dachshund: 0.25, small_mammal: 0.25, basset_hound: 0.25}`
            
    - Yes, I have a friendly, social dog
        
        - `{golden_retriever: 0.16, corgi: 0.16, border_collie: 0.16, dachshund: 0.16, basset_hound: 0.16, mastiff: 0.16}`
            
    - Yes, I have a dog and they prefer their space (senior dog, reactive dogs)
        
        - `{amphibian_fish_reptile: 0.5, tamagotchi: 0.5}`
            
    - No
        
        - make all 0 - implicit
            
5. **Why do you want a pet?**
    
    - Companionship/cuddle buddy
        
        - `{cat: 0.16, dachshund: 0.16, golden_retriever: 0.16, bird: 0.16, basset_hound: 0.16, corgi: 0.16}`
            
    - Aesthetics/decoration
        
        - `{amphibian_fish-reptile: 0.5, small_mammal: 0.5}`
            
    - Teach children responsibility
        
        - `{small_mammal: 1.0}`
            
6. **How often do you travel?**
    
    - 1-3 weeks/year
        
        - make all 0, this is doable for all pets on the list
            
    - 4-6 weeks/year
        
        - `{amphibian_fish_reptile: 0.5, cat: 0.5}`
            
    - 6+ weeks/year
        
        - `{amphibian_fish_reptile: 0.5, tamagotchi: 0.5}`
            
7. **What is your monthly budget for a pet?**
    
    - Less than $50
        
        - `{amphibian_fish_reptile: 0.33, small_mammal: 0.33, cat: 0.33}`
            
    - $50-100
        
        - `{cat: 0.25, dachshund: 0.25, corgi: 0.25, bird: 0.25}`
            
    - $100+
        
        - `{golden_retriever: 0.25, mastiff: 0.25, border_collie: 0.25, basset_hound: 0.25}`
            
8. **How comfortable are you with grooming and cleanup?**
    
    - Fine with regular grooming/maintenance
        
        - `{golden_retriever: 0.20, border_collie: 0.20, cat: 0.20, bird: 0.20, corgi: 0.20}`
            
    - Prefer low maintenance pets
        
        - `{small_mammal: 0.25, amphibian_fish_reptile: 0.25, dachshund: 0.25, basset_hound: 0.25}`
            
    - Allergic/sensitive to odor
        
        - `{amphibian_fish_reptile: 0.5, tamagotchi: 0.5}`
            
9. **What's your daily schedule like?**
    
    - Home most of the day (remote work, retired)
        
        - weight all pets at 0
            
    - Gone during typical work hours (9-5)
        
        - `{cat: 0.33, amphibian_fish_reptile: 0.33, small_mammal: 0.33}`
            
    - Irregular schedule (freelance)
        
        - `{cat: 0.25, amphibian_fish_reptile: 0.25, small_mammal: 0.25, bird: 0.25}`
            
10. **What kind of temperament are you looking for in a pet?**
    
    - Laid-back, chill
        
        - `{amphibian_fish_reptile: 0.25, mastiff: 0.25, basset_hound: 0.25, cat: 0.25}`
            
    - Playful and energetic
        
        - `{dachshund: 0.25, golden_retriever: 0.25, border_collie: 0.25, corgi: 0.25}`
            
    - Independent
        
        - `{amphibian_fish_reptile: 0.33, tamagotchi: 0.33, cat: 0.33}`
            
    - Affectionate and cuddly
        
        - `{dachshund: 0.16, golden_retriever: 0.16, cat: 0.16, small_mammal: 0.16, basset_hound: 0.16, corgi: 0.16}`