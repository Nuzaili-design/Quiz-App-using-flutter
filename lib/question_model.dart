class Question{
   final String questionText;
   final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer{
   final String answerText;
   final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions(){
   List<Question> list =[];
  list.add(Question("Where is Mecca located ?",

   [
     Answer("Qatar", false),
      Answer("Iraq", false),
      Answer("Saudi Arabia", true),
      Answer("Yemen", false),
   ],)
  );


   list.add(Question("Where is Okan University located ?",

      [
         Answer("Ankara", false),
         Answer("Mersin", false),
         Answer("Gaziantep", false),
         Answer("Istanbul", true),
      ],)
   );

   list.add(Question("What is the capital of Turkiye ?",

      [
         Answer("Ankara", true),
         Answer("Istanbul", false),
         Answer("Antalya", false),
         Answer("Izmir", false),
      ],)
   );

   list.add(Question("What is the official language in Turkiye ?",

      [
         Answer("Arabic", false),
         Answer("Turkish",true),
         Answer("English", false),
         Answer("German", false),
      ],)
   );

   return list;
}