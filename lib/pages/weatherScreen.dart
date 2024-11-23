part of weather_app;

class WeatherScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _weatherSearch = TextEditingController();
    final locationName = ref.watch(locationNameProvider);
    final weatherData = locationName.isNotEmpty
        ? ref.watch(weatherDataProvider(locationName))
        : null; //當一load進這個build的時候，預防call API

    return Scaffold(
      appBar: AppBar(
        title: weatherData == null
            ? Text("PSF_天氣APP")
            : weatherData.when(
                data: (data) => Text(data.datasetDescription!),
                error: (err, stack) => Text("Error"),
                loading: () => Text("等待..."),
              ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _searchBar(_weatherSearch, () {
            String inputLocation = _weatherSearch.text.trim();
            if (inputLocation.isNotEmpty) {
              inputLocation =
                  inputLocation.replaceAll("，", ","); //有兩種語言的 逗號(EN/CN)
              ref.read(locationNameProvider.notifier).state =
                  inputLocation; //把空的值 變成 textController的值
            }
          }, ref),
          Consumer(
            builder: (context, ref, _) {
              return locationName.isNotEmpty
                  ? viewWeather(context, weatherData)
                  : Center(child: Text('請輸入縣市名稱'));
            },
          ),
        ],
      ),
    );
  }
}

Widget _searchBar(TextEditingController searchDataController,
    VoidCallback _rerender, WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextField(
              onSubmitted: (_) {
                //這邊是為了 本身device的 done或enter 鍵的event
                _rerender();
              },
              controller: searchDataController,
              decoration: InputDecoration(hintText: '輸入縣市(如需多項 請加 ","符號)'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: _rerender,
            child: Container(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text("查詢"),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget viewWeather(BuildContext context, AsyncValue<WeatherData>? weatherData) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.025,
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            weatherData!.hasError ? Text("") : Text("縣市:"),
            weatherData.when(
              data: (data) {
                return data.location != null && data.location!.isNotEmpty
                    ? Column(
                        children: data.location!.asMap().entries.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        e.value.locationName ?? "",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    _displayWxDetails(e.value.weatherElement!),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    : Text("查無資料");
              },
              error: (err, stack) => Text(
                "Error: $err",
                style: TextStyle(color: Colors.red),
              ),
              loading: () => CircularProgressIndicator(),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _displayWxDetails(List<WeatherElement> weatherElements) {
  var wxElement = weatherElements.firstWhere(
    (element) => element.elementName == 'Wx',
    orElse: () => new WeatherElement(), // 有嘗試過放null，原因還不明先暫時給個instance
  );

  if (wxElement.time!.isEmpty) {
    return Text("無天氣資料");
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: wxElement.time!.map((timePeriod) {
      return Text(
        "開始時間:${timePeriod.startTime}\n"
        "結束時間:${timePeriod.endTime}\n"
        "天氣:${timePeriod.parameter!.parameterName}",
      );
    }).toList(),
  );
}
