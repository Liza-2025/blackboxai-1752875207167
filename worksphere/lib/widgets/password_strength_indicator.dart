import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../utils/constants.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final PasswordStrength strength;
  final String password;

  const PasswordStrengthIndicator({
    Key? key,
    required this.strength,
    required this.password,
  }) : super(key: key);

  Color getIndicatorColor() {
    switch (strength) {
      case PasswordStrength.Weak:
        return Colors.red;
      case PasswordStrength.Medium:
        return Colors.orange;
      case PasswordStrength.Strong:
        return Colors.green;
    }
  }

  String getIndicatorText() {
    switch (strength) {
      case PasswordStrength.Weak:
        return "Weak";
      case PasswordStrength.Medium:
        return "Medium";
      case PasswordStrength.Strong:
        return "Strong";
    }
  }

  double getStrengthValue() {
    switch (strength) {
      case PasswordStrength.Weak:
        return 0.33;
      case PasswordStrength.Medium:
        return 0.66;
      case PasswordStrength.Strong:
        return 1.0;
    }
 The last step was creating the password strength indicator widget file. Since I did not receive confirmation of success for that, I will retry creating the password_strength_indicator.dart widget now to continue the task.

<create_file>
<path>worksphere/lib/widgets/password_strength_indicator.dart</path>
<content>
import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../utils/constants.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final PasswordStrength strength;
  final String password;

  const PasswordStrengthIndicator({
    Key? key,
    required this.strength,
    required this.password,
  }) : super(key: key);

  Color getIndicatorColor() {
    switch (strength) {
      case PasswordStrength.Weak:
        return Colors.red;
      case PasswordStrength.Medium:
        return Colors.orange;
      case PasswordStrength.Strong:
        return Colors.green;
    }
  }

  String getIndicatorText() {
    switch (strength) {
      case PasswordStrength.Weak:
        return "Weak";
      case PasswordStrength.Medium:
        return "Medium";
      case PasswordStrength.Strong:
        return "Strong";
    }
  }

  double getStrengthValue() {
    switch (strength) {
      case PasswordStrength.Weak:
        return 0.33;
      case PasswordStrength.Medium:
        return 0.66;
      case PasswordStrength.Strong:
        return 1.0;
    }
  }

  List<String> getPasswordRequirements() {
    List<String> requirements = [];
    
    if (password.length < 6) {
      requirements.add("At least 6 characters");
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      requirements.add("One uppercase letter");
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      requirements.add("One lowercase letter");
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      requirements.add("One number");
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      requirements.add("One special character");
    }
    
    return requirements;
  }

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            const Text(
              "Password strength: ",
              style: AppTextStyles.bodyText2,
            ),
            Text(
              getIndicatorText(),
              style: TextStyle(
                fontSize: 14,
                color: getIndicatorColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        LinearProgressIndicator(
          value: getStrengthValue(),
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(getIndicatorColor()),
        ),
        if (strength != PasswordStrength.Strong) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            "Missing requirements:",
            style: AppTextStyles.bodyText2.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          ...getPasswordRequirements().map((requirement) => Padding(
                padding: const EdgeInsets.only(left: AppSpacing.sm),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      requirement,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ],
    );
  }
}
