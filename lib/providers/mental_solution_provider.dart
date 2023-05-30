import 'package:flutter/material.dart';

class MentalSolutionProvider extends ChangeNotifier {
  List<Map<dynamic, dynamic>> solutions = [
    {
      'title': 'Progressive Muscle Relaxation',
      'subtitle':
          'By systematically tensing and relaxing different muscle groups, it makes you more aware of areas of tension in their body and learn to release that tension through intentional relaxation techniques.',
      'image': 'https://i.ibb.co/t3f0XGT/mental-exercises-4.png',
      'audio': 'https://dl.sndup.net/t2v3/pmr_2.mp3',
      'description':
          'Progressive Muscle Relaxation (PMR) is a relaxation technique that involves tensing and relaxing specific muscle groups in a systematic way. The goal of PMR is to help individuals release physical tension and promote relaxation throughout the body.',
      'tips': [
        'Find a quiet and comfortable place with no disturbance.',
        'Sit or lie down in a relaxed position with your eyes closed.',
        'Start tensing your muscles, (a special muscle group may be hands, biceps, or forearm) starting from head moving towards the toe.',
        'Hold the tension for few seconds and then release it.',
        'Move on to the next muscle group and continue it for each muscle group.',
        'Keep your mind thought-free during the process.',
        'After the completion, take some deep breaths and return to the normal state of consciousness.'
      ],
    },
    {
      'title': 'Visualization',
      'subtitle':
          'Involves creating a mental image or scenario that is soothing, calming, and peaceful, which can help promote feelings of relaxation and calmness that are conducive to sleep.',
      'image': 'https://i.ibb.co/fnK1H0N/visualization.png',
      'audio': 'https://dl.sndup.net/zksp/visualization.mp3',
      'description':
          ' By incorporating this technique into a regular bedtime routine, one can create a peaceful and calming environment that promotes restful sleep.',
      'tips': [
        'Find a quiet and comfortable place with no distractions.',
        'Sit or lie down in a relaxed position.',
        'Take some deep breaths and release any tension present in your body.',
        'Imagine a scene in your mind. It can be peaceful natural thing or the specific image of the goal you want to achieve.',
        'Use all your senses to create the mental image.',
        'Do not get distracted while visualization. If your mind wanders, bring it again to the visualization.',
        'Finally take a moment to express gratitude for the experience and the positive outcomes you have imagined.'
      ]
    },
    {
      'title': 'Meditation',
      'subtitle':
          'A mental practice that involves focusing the mind on a particular object, thought, or activity to achieve a state of calmness, relaxation, and mental clarity',
      'image': 'https://i.ibb.co/2S4LYP3/mental-exercises-3.png',
      'audio': 'https://dl.sndup.net/xt5w/meditation.mp3',
      'description':
          'Meditation is a technique that has been practiced for thousands of years, primarily for its mental, emotional, and spiritual benefits. It involves focusing one\'s attention on a particular object, thought, or activity to calm the mind and promote relaxation.',
      'tips': [
        'Before starting meditation, set your intention for the practice. Or set your goal for meditation.',
        'Sit in a comfortable position, with your back straight and your hands resting on your knees or in your lap.',
        'Focus on your breath and try to stay present with the sensations of inhaling and exhaling.',
        'When the thoughts starts drifting away from the breath, gently bring your attention back to the breath.',
        'Just focus on your present state. Remove all your past and future thoughts.',
        'At the end, take some deep breaths and slowly bring your attention back to your surroundings.'
      ]
    },
    {
      'title': 'Autogenic Relaxation',
      'subtitle':
          'Using self-suggestion to create a sense of relaxation and well-being in the body.involves repeating a set of phrases or mental images that are designed to create feelings of warmth, heaviness, and relaxation in different parts of the bod',
      'image': 'https://i.ibb.co/mz9tgFT/mental-exercises-2.png',
      'audio': "https://dl.sndup.net/tx9c/autogenic_relaxation.mp3",
      'description':
          'It involves a series of self-induced sensations of warmth, heaviness, and relaxation in different parts of the body, which can promote a deep state of relaxation and reduce stress and anxiety.It is a non-invasive and self-directed technique that can be practiced almost anywhere, making it a popular choice for anyone looking to manage stress and promote relaxation in their daily life.',
      'tips': [
        'Sit or lie down in a comfortable position, and close your eyes.',
        'Take a few deep breaths, and start relaxing your muscles, starting from the head to the toe.',
        'Breathe in slowly and deeply through your nose, and exhale through your mouth.',
        'Now, begin to repeat a series of phrase to yourself like “my mind is calm and peaceful”, “my breathing is slow and deep”,etc. These phrases should be repeated slowly and deliberately.',
        'With the repetition of these phrases, dive deeper and deeper into relaxation.',
        'After 10-15 minutes, take deep breaths, wiggle your fingers and toes, and open your eyes.'
      ]
    },
    {
      'title': 'Deep Breathing',
      'subtitle':
          'A mental practice that involves focusing the mind on a particular object, thought, or activity to achieve a state of calmness, relaxation, and mental clarity',
      'image': 'https://i.ibb.co/5kLCRYN/mental-exercises-5.png',
      'audio': 'https://dl.sndup.net/sh7n/deep-breathing_G21xtl28.mp3',
      'description':
          'Deep breathing is a relaxation technique that involves taking slow, deep breaths from the diaphragm rather than shallow breaths from the chest.It can help to slow down your heart rate, lower your blood pressure, and promote a sense of calm and relaxation in both the mind and body.',
      'tips': [
        'Find a quiet and comfortable place to sit or lie down.',
        'Place one hand on your belly and other one on your chest.',
        'Inhale slowly through your nose, feeling your belly rise and your chest expand.',
        'Take a pause of few seconds.',
        'Exhale slowly through your mouth, feeling your body fall and your chest deflate.',
        'Again take a pause for few seconds.',
        'Gradually increase your length of inhalation and exhalation.',
        'Continue the process for 10-15 minutes.'
      ]
    }
  ];

  Map<dynamic, dynamic> getSolution(String title) {
    return solutions.firstWhere((element) => element['title'] == title);
  }
}
