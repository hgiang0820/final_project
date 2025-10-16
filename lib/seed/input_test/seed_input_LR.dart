// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedInputLR() async {
  final db = FirebaseFirestore.instance;
  final testId = 'testLR';

  // Firestore: Create test document
  await db.collection('input_tests').doc(testId).set({
    'title': 'TOEIC Practice Listening & Reading',
    'parts': ['part1', 'part2', 'part3', 'part4', 'part5', 'part6', 'part7'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  // // === PART 1 === LISTENING
  final part1Questions = [
    {
      'question': "",
      'options': [
        'She is writing on a chalkboard.',
        'She is typing on a keyboard.',
        'She is carrying a box.',
        'She is standing at a counter.',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 1',
    },
    {
      'question': "",
      'options': [
        'The bicycles are parked near a fence.',
        'The people are riding bicycles in the park.',
        'Some bicycles are being repaired.',
        'The bicycles are on a boat.',
      ],
      'correctIndex': 0,
      'explain': 'Explain of question 2',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part1')
      .set({
        'type': 'Picture description',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': 2,
      });

  for (int i = 1; i <= 2; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part1Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part1')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 2 === LISTENING
  final part2Questions = [
    {
      'question': "Where is the nearest post office?",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Explain of question 1',
    },
    {
      'question': "When will the package arrive?",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Explain of question 2',
    },
    {
      'question': "Would you like to join us for lunch?",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Explain of question 3',
    },
    {
      'question': "Who is responsible for this project?",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Explain of question 4',
    },
    {
      'question': "Why did you cancel the meeting?",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Explain of question 5',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part2')
      .set({
        'type': 'Question & Response',
        'audioPath': 'input_tests/testLR/part2/01%20Test%201_LC_Voca.mp3',
        'questionCount': 5,
      });

  for (int i = 1; i <= 5; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part2Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part2')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 3 === LISTENING
  final part3Questions = [
    {
      'question': "What problem does the man mention?",
      'options': [
        'The printer isn’t working.',
        'He lost a report.',
        'The meeting was canceled.',
        'He needs computer training.',
      ],
      'correctIndex': 0,
      'explain': 'Explain of question 1',
    },
    {
      'question': "Who has not been contacted yet?",
      'options': [
        'The IT department.',
        'The manager.',
        'The client.',
        'The receptionist.',
      ],
      'correctIndex': 0,
      'explain': 'Explain of question 2',
    },
    {
      'question': "Why can’t the woman help?",
      'options': [
        'She is too busy.',
        'She doesn’t know how.',
        'She is leaving the company.',
        'She is fixing another machine.',
      ],
      'correctIndex': 0,
      'explain': 'Explain of question 3',
    },
    {
      'question': "What are they preparing?",
      'options': [
        'A report.',
        'A presentation.',
        'A meeting.',
        'A conference.',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 4',
    },
    {
      'question': "What does the woman still need to do?",
      'options': [
        'Print the report.',
        'Prepare the slides.',
        'Call the client.',
        'Book the meeting room.',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 5',
    },
    {
      'question': "What does the man offer to do?",
      'options': [
        'Deliver the slides.',
        'Check the slides.',
        'Present the slides.',
        'Print the slides.',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 6',
    },
    {
      'question': "How does the woman respond?",
      'options': [
        'She declines.',
        'She agrees.',
        'She doesn’t answer.',
        'She changes the topic.',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 7',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part3')
      .set({
        'type': 'Conversations',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': 7,
      });

  for (int i = 1; i <= 7; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part3Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part3')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 4 === LISTENING
  final part4Questions = [
    {
      'question': "Where is this announcement being made?",
      'options': [
        'At a train station.',
        'At a museum.',
        'At a hotel.',
        'At a school.',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 1',
    },
    {
      'question': "How can visitors buy tickets?",
      'options': [
        'At the counter or online.',
        'Only by phone.',
        'Only on weekends.',
        'Through a travel agency.',
      ],
      'correctIndex': 0,
      'explain': 'Explain of question 2',
    },
    {
      'question': "How often are guided tours offered?",
      'options': [
        'Every hour.',
        'Every two hours.',
        'Every morning.',
        'Every weekend.',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 3',
    },
    {
      'question': "What is being announced?",
      'options': [
        'A flight delay.',
        'A flight cancellation.',
        'A gate change.',
        'A boarding call.',
      ],
      'correctIndex': 0,
      'explain': 'Explain of question 4',
    },
    {
      'question': "Why was the flight delayed?",
      'options': [
        'Because of mechanical issues.',
        'Because of weather conditions.',
        'Because of air traffic.',
        'Because of missing crew.',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 5',
    },
    {
      'question': "What should passengers do?",
      'options': [
        'Check the information screens.',
        'Go to the boarding gate.',
        'Pick up their luggage.',
        'Contact customer service.',
      ],
      'correctIndex': 0,
      'explain': 'Explain of question 6',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part4')
      .set({
        'type': 'Talks',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': 6,
      });

  for (int i = 1; i <= 6; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part4Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part4')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 5 === READING
  final part5Questions = [
    {
      'question': "The manager ______ the new policy at the meeting yesterday.",
      'options': ['announce', 'announcing', 'announced', 'announces'],
      'correctIndex': 2,
      'explain': 'Explain of question 1',
    },
    {
      'question':
          "The company will hire additional staff ______ the workload has increased.",
      'options': ['although', 'because', 'despite', 'unless'],
      'correctIndex': 1,
      'explain': 'Explain of question 2',
    },
    {
      'question':
          "Please make sure that all forms are ______ before submission.",
      'options': ['complete', 'completed', 'completion', 'completely'],
      'correctIndex': 1,
      'explain': 'Explain of question 3',
    },
    {
      'question': "The seminar will take place ______ March 15th.",
      'options': ['on', 'in', 'at', 'by'],
      'correctIndex': 0,
      'explain': 'Explain of question 4',
    },
    {
      'question':
          "Our sales team is looking forward to ______ new clients at the exhibition.",
      'options': ['meet', 'meeting', 'meets', 'met'],
      'correctIndex': 1,
      'explain': 'Explain of question 5',
    },
    {
      'question': "Mr. Lee has worked here ______ more than ten years.",
      'options': ['for', 'since', 'during', 'until'],
      'correctIndex': 0,
      'explain': 'Explain of question 6',
    },
    {
      'question':
          "The company offers a wide range of products at very ______ prices.",
      'options': ['compete', 'competitive', 'competition', 'competitively'],
      'correctIndex': 1,
      'explain': 'Explain of question 7',
    },
    {
      'question':
          "If you have any questions, please do not ______ to contact me.",
      'options': ['hesitate', 'hesitation', 'hesitant', 'hesitating'],
      'correctIndex': 0,
      'explain': 'Explain of question 8',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part5')
      .set({'type': 'Incomplete sentences', 'questionCount': 8});

  for (int i = 1; i <= 8; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part5Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part5')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 6 === READING
  final part6Questions = [
    {
      'question':
          "Email:\n\nTo: All Employees\nFrom: HR Department\nSubject: Annual Health Check\n\nOur annual health check will be held next week in the main conference room. Please remember to bring your employee ID card. The health check is ______ (Q29) to all staff members. The process usually takes about 30 minutes, and appointments are ______ (Q30) online through the HR portal.Also, please avoid eating heavy meals before the check. The results will be sent to your registered e-mail ______ (Q31) two weeks. Thank you for your cooperation.\n\nIf you have questions, contact the HR department ______ (Q32) extension 123.",
      'options': ['optional', 'required', 'restricted', 'limited'],
      'correctIndex': 2,
      'explain': 'Explain of question 1',
    },
    {
      'question': "",
      'options': ['made', 'making', 'to make', 'makes'],
      'correctIndex': 2,
      'explain': 'Explain of question 2',
    },
    {
      'question': "",
      'options': ['on', 'at', 'by', 'for'],
      'correctIndex': 2,
      'explain': 'Explain of question 3',
    },
    {
      'question': "",
      'options': ['on', 'by', 'with', 'at'],
      'correctIndex': 2,
      'explain': 'Explain of question 4',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part6')
      .set({'type': 'Text completion', 'questionCount': 4});

  for (int i = 1; i <= 4; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part6Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part6')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 7 === READING
  final part7Questions = [
    {
      'question':
          "Green Café is offering a special discount this month. Customers who purchase two drinks will receive one free snack. The promotion is available at all branches until the end of September. Members can also collect double reward points during this period.\n\nWhat is Green Café offering?",
      'options': [
        'A free drink with every purchase',
        'A free snack with two drinks',
        'A discount on membership',
        'Free delivery service',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 1',
    },
    {
      'question': "Where is the promotion available?",
      'options': [
        'Only at the main branch',
        'At all branches',
        'Online only',
        'At selected locations',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 2',
    },
    {
      'question': "Until when is the promotion valid?",
      'options': [
        'End of July',
        'End of August',
        'End of September',
        'End of October',
      ],
      'correctIndex': 2,
      'explain': 'Explain of question 3',
    },
    {
      'question': "What additional benefit do members get?",
      'options': [
        'Free snacks',
        'Free drinks',
        'Double points',
        'Free membership',
      ],
      'correctIndex': 2,
      'explain': 'Explain of question 4',
    },
    {
      'question':
          "Job Posting: Marketing Assistant\n\nWe are seeking a Marketing Assistant to join our team. The successful candidate should have at least one year of experience in marketing or a related field. Responsibilities include preparing promotional materials, assisting with social media campaigns, and coordinating events. Candidates must have strong communication skills and be able to work as part of a team.\n\nInterested applicants should send a resume and cover letter to jobs@abccompany.com by October 10.\n\nWhat position is being advertised?",
      'options': [
        'Sales Manager',
        'Marketing Assistant',
        'Event Coordinator',
        'Social Media Specialist',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 5',
    },
    {
      'question': "How much experience is required?",
      'options': [
        'None',
        'At least one year',
        'At least three years',
        'More than five years',
      ],
      'correctIndex': 1,
      'explain': 'Explain of question 6',
    },
    {
      'question': "What is one of the responsibilities mentioned?",
      'options': [
        'Designing websites',
        'Writing software',
        'Coordinating events',
        'Managing finances',
      ],
      'correctIndex': 2,
      'explain': 'Explain of question 7',
    },
    {
      'question': "When is the application deadline?",
      'options': ['October 5', 'October 10', 'October 15', 'October 20'],
      'correctIndex': 1,
      'explain': 'Explain of question 8',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part7')
      .set({'type': 'Reading comprehension', 'questionCount': 8});

  for (int i = 1; i <= 8; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part7Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part7')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }
}
