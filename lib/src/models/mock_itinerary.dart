// Mock data structures to simulate real data until a backend is connected.
const Map<String, dynamic> mockItinerary = {
  "tripName": "Parisian Adventure",
  "dates": "October 26 - October 30, 2024",
  "days": [
    {
      "day": 1,
      "activities": [
        {
          "title": "Eiffel Tower Visit",
          "time": "10:00 AM",
          "location": "Champ de Mars, 5 Avenue Anatole France",
          "description":
              "A stunning iron tower, an icon of Paris. Enjoy breathtaking views from the top. The AI suggests going early to avoid the crowds and enjoy the morning light over the city.",
        },
        {
          "title": "Louvre Museum Tour",
          "time": "1:00 PM",
          "location": "Rue de Rivoli, 75001 Paris",
          "description":
              "Home to thousands of works of art, including the Mona Lisa and the Venus de Milo. A must-see for art lovers.",
        },
        {
          "title": "Dinner in Le Marais",
          "time": "7:00 PM",
          "location": "Le Marais District",
          "description":
              "Explore the historic and trendy Le Marais district and enjoy dinner at a classic French bistro.",
        },
      ],
    },
    // Add more days if needed
  ],
  "nearbySuggestions": {
    "restaurants": [
      {
        "name": "Le Procope",
        "rating": 4.8,
        "reviews": 1126,
        "details": "\$S\$ • French Cuisine",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThRhJNkQ-gQ8IB9xz0u2fnVEnCpjw2XORpgyIypn2z8obVAlPDMkLS4yfMYP_lWMzMuHI&usqp=CAU",
      },
      {
        "name": "Bistrot Paul Bert",
        "rating": 4.5,
        "reviews": 987,
        "details": "\$\$ • Steakhouse",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThRhJNkQ-gQ8IB9xz0u2fnVEnCpjw2XORpgyIypn2z8obVAlPDMkLS4yfMYP_lWMzMuHI&usqp=CAU",
      },
    ],
    "hotels": [],
  },


  "budgetBreakdown": {
      "accommodation": "NotZero Innovation Hub",
      "food": "Rice and Bean",
      "activities": "City Tours",
      "transportation": "Metro Pass",
      "miscellaneous": "Souvenirs and Snacks",
    },

    
};
