import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmer extends StatelessWidget {
  const NewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
      return const NewsItemShimmer();
    }, separatorBuilder:(context,index){
      return SizedBox(
        height: 16,
      );
    } , itemCount: 5);
  }
}


class NewsItemShimmer extends StatelessWidget {
  const NewsItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 150,
                child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[200]!,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0)),
                    )),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 16,
                    width: 90,
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0)),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 10,
                    width: 100,
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0)),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 10,
                    width: 90,
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0)),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}