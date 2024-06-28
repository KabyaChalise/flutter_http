import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String operation;
  final String? description;
  final Color? operationColor;
  final VoidCallback? onPressed;
  final TextEditingController? nameController;
  final TextEditingController? idController;
  const AppButton({
    super.key,
    required this.operation,
    this.description,
    this.operationColor = Colors.black,
    this.onPressed,
    this.nameController,
    this.idController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MaterialButton(
        onPressed: () {
          onPressed?.call();
        },
        color: Colors.white,
        height: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              operation,
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Menlo',
                fontWeight: FontWeight.w900,
                color: operationColor,
              ),
            ),
            if(idController != null)
              Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w200),
                controller: idController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 100),
                  border: InputBorder.none,
                  hintText: "ID",hintStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.w200)
                ),
              )),
            if(nameController != null)
              Expanded(
                  child: TextField(
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w200),
                controller: nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 70),
                  border: InputBorder.none,
                  hintText: "Name",hintStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.w200)
                ),
              )),
            if (description != null) // Render description if not null
              Text(
                description!,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w200),
              ),
          ],
        ),
      ),
    );
  }
}
