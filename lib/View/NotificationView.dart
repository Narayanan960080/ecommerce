import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Status.dart';
import '../ViewModel/HomeVM.dart';
import 'DetailsView.dart';


class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {

  final HomeVM _api = HomeVM();

  fetchData(bool isRefresh){

    HomeVM model = Provider.of<HomeVM>(context, listen: false);
    Map<String,dynamic> params ={
      "after": "",
    };
      _api.fetch(params,model);
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchData(false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xff29D177),
              child: Icon(Icons.arrow_back_rounded,color: Colors.white,),
            ),
          ),
        ),
        title: const Text("Notifications",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: Consumer<HomeVM>(builder: (context, viewModel, _) {
        switch (viewModel.getData.status) {
          case Status.loading:
            return  const Center(child: CircularProgressIndicator(color: Color(0xff29D177),));
          case Status.error:
            return const Center(child: Center(child: Text("Something Issue"),))  ;
          case Status.completed:
            var VM = viewModel.listOfData;
            return
              VM.isEmpty ?
              const Center(child:Center(child: Text("No Record Found",style: TextStyle(fontWeight: FontWeight.bold),),)) :
              ListView.builder(
                itemCount: viewModel.listOfData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsView(data: viewModel.listOfData[index])));
                      },
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10,),
                            SizedBox(
                                height: 130,
                                width: 80,
                                child:  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child:
                                    Image.network(
                                      viewModel.listOfData[index].details!.thumbnail.toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context, object ,  stackTrace) {
                                        return const Center(child: Icon(Icons.error,color: Colors.orangeAccent,),);
                                      },
                                    )
                                )
                            ),
                            const SizedBox(width: 17,),
                            Container(
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 180,
                                        child: Text(viewModel.listOfData[index].details!.title.toString(),style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 16),overflow: TextOverflow.ellipsis,maxLines: 5,)),
                                  ],
                                )
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 30,
                              child: Center(
                                child:CircleAvatar(
                                    backgroundColor: Colors.grey[200],
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.thumb_up_alt_outlined,color: Colors.orangeAccent,size: 17,),
                                        // Text(viewModel.listOfData[index].details!.likes.toString() == "null" ? "0" : viewModel.listOfData[index].details!.likes.toString() ,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600)),

                                      ],
                                    )) ,
                              ),
                            ),
                            const SizedBox(width: 8,),
                          ],
                        ),

                      ),
                    ),
                  );
                },
              );



          default:
        }
        return Container();
      }),

    );
  }
}
