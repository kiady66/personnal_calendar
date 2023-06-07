

class Api {
  static Future<List<Map<String, dynamic>>> getSubjectList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
        {
          "id": 1,
          "title": "Mathematics",
          "description": "Study of numbers, quantities, structures, spaces, and changes."
        },
        {
          "id": 2,
          "title": "Physics",
          "description": "Study of fundamental properties of matter, energy, and their interactions."
        },
        {
          "id": 3,
          "title": "Chemistry",
          "description": "Study of substances, their properties, composition, and reactions."
        },
        {
          "id": 4,
          "title": "Biology",
          "description": "Study of living organisms, their structure, function, growth, and evolution."
        },
        {
          "id": 5,
          "title": "English Literature",
          "description": "Study of written works of the English language, including novels, poetry, and drama."
        },
        {
          "id": 6,
          "title": "History",
          "description": "Study of past events, particularly human affairs, based on evidence and interpretation."
        },
        {
          "id": 7,
          "title": "Geography",
          "description": "Study of the Earth's physical features, climate, population, and the relationships between humans and their environments."
        },
        {
          "id": 8,
          "title": "Computer Science",
          "description": "Study of computers, programming, algorithms, and the use of technology to solve problems."
        }
      ];
  }
}