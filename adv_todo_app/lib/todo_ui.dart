import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'todo_model.dart';

class Adv_ToDo_App extends StatefulWidget {
  const Adv_ToDo_App({super.key});

  @override
  State createState() => _Adv_Todo_AppState();
}

class _Adv_Todo_AppState extends State {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController dateEditingController = TextEditingController();

  List<TodoModel> advtodolist = [
    TodoModel(
      title: "Army",
      description: "Para SF, RR, Gorkha",
      date: " 20 Oct 2024",
    ),
    TodoModel(
      title: "Nevy",
      description: "Marcos, MarineComando",
      date: " 21 Oct 2024",
    ),
    TodoModel(
      title: "AirForce",
      description: "Garud, IAF",
      date: " 22 Oct 2024",
    ),
  ];
  void clearControllers() {
    titleEditingController.clear();
    descriptionEditingController.clear();
    dateEditingController.clear();
  }

  void submit(bool doEdit, [TodoModel? todoObj]) {
    if (titleEditingController.text.trim().isNotEmpty &&
        descriptionEditingController.text.trim().isNotEmpty &&
        dateEditingController.text.trim().isNotEmpty) {
      if (doEdit) {
        todoObj!.title = titleEditingController.text;
        todoObj.description = descriptionEditingController.text;
        todoObj.date = dateEditingController.text;
      } else {
        advtodolist.add(
          TodoModel(
            title: titleEditingController.text,
            description: descriptionEditingController.text,
            date: dateEditingController.text,
          ),
        );
      }
    }
    Navigator.of(context).pop();
    clearControllers();
    setState(() {});
  }

  void showBottomSheet(bool doEdit, [TodoModel? todoObj]) {
    showModalBottomSheet(
        // isScrollControlled: true,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Create To-Do",
                        style: GoogleFonts.quicksand(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Title",
                      style: GoogleFonts.quicksand(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(89, 57, 241, 1)),
                    ),
                    TextField(
                      controller: titleEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(89, 57, 241, 1)),
                    ),
                    TextField(
                      controller: descriptionEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Date",
                      style: GoogleFonts.quicksand(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(89, 57, 241, 1)),
                    ),
                    TextField(
                      controller: dateEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1)),
                        ),
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                      ),
                      onTap: () async {
                        DateTime? pickDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2025));
                        String formattedDate =
                            DateFormat.yMMMd().format(pickDate!);
                        setState(() {
                          dateEditingController.text = formattedDate;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromRGBO(89, 57, 241, 1))),
                          onPressed: () {
                            if (doEdit) {
                              submit(true, todoObj);
                            } else {
                              submit(false, todoObj);
                            }
                          },
                          child: Text(
                            "Submit",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
                Text("Vaibhav",
                    style: GoogleFonts.quicksand(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1)))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
              child: Column(
                children: [
                  Text(
                    "CREATE TODO LIST",
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        // color: Colors.red,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                  itemCount: advtodolist.length,
                                  itemBuilder: (BuildContext constext, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        89, 57, 241, 1),
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        titleEditingController
                                                                .text =
                                                            advtodolist[index]
                                                                .title;
                                                        descriptionEditingController
                                                                .text =
                                                            advtodolist[index]
                                                                .description;

                                                        dateEditingController
                                                                .text =
                                                            advtodolist[index]
                                                                .date;
                                                        showBottomSheet(
                                                          true,
                                                          advtodolist[index],
                                                        );
                                                      });
                                                    },
                                                    child: const Icon(
                                                      Icons.edit,
                                                      size: 18,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color.fromRGBO(
                                                              89, 57, 241, 1)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        advtodolist.remove(
                                                            advtodolist[index]);
                                                      });
                                                    },
                                                    child: const Icon(
                                                      Icons.delete,
                                                      size: 18,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.16),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                              blurStyle: BlurStyle.outer,
                                            )
                                          ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        217, 217, 217, 1),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child:
                                                      const Icon(Icons.image),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          // "Lorem Ipsum is simply dummy industry. ",
                                                          // style: GoogleFonts.inter(
                                                          //     fontSize: 11,
                                                          //     fontWeight:
                                                          //         FontWeight
                                                          //             .w900,
                                                          //     color: const Color
                                                          //         .fromRGBO(
                                                          //         0, 0, 0, 1)),
                                                          advtodolist[index]
                                                              .title,
                                                          style: GoogleFonts.inter(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: const Color
                                                                  .fromRGBO(
                                                                  0, 0, 0, 1)),
                                                        ),
                                                        Text(
                                                          // "Simply dummy text of the printing and type setting industry. Lorem Ipsum Lorem Ipsum Lorem. ",
                                                          advtodolist[index]
                                                              .description,
                                                          style: GoogleFonts.inter(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: const Color
                                                                  .fromRGBO(
                                                                  0, 0, 0, 1)),
                                                        ),
                                                        Text(
                                                          // "10 July 2023 ",
                                                          // style: GoogleFonts.inter(
                                                          //     fontSize: 8,
                                                          //     fontWeight:
                                                          //         FontWeight
                                                          //             .w600,
                                                          //     color: const Color
                                                          //         .fromRGBO(
                                                          //         0, 0, 0, 1)),
                                                          advtodolist[index]
                                                              .date,
                                                          style: GoogleFonts.inter(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: const Color
                                                                  .fromRGBO(
                                                                  0, 0, 0, 1)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(false);
        },
        backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
