import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/modal.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/text.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/toast.dart';
import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;


class _CalendarioOptionItem {
  final String id;
  final String nome;

  _CalendarioOptionItem({ this.id, this.nome });
}

class CalendarHelper {
  static DeviceCalendarPlugin _deviceCalendarPlugin;

  static _getInstance() {
    if (_deviceCalendarPlugin == null) _deviceCalendarPlugin = new DeviceCalendarPlugin();
  }

  static hasPermission() async {
    _getInstance();
    
    var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();

    if (permissionsGranted.isSuccess && !permissionsGranted.data) {

      permissionsGranted = await _deviceCalendarPlugin.requestPermissions();

      if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  static void add(BuildContext context, { String titulo, String descricao, String dataInicio, String hora, String dataFim }) async {
    _getInstance();
    
    final calendars = await _deviceCalendarPlugin.retrieveCalendars();
    
    Modal.show(
      context,
      title: 'Selecione o calendário',
      body: Container(
        width: 300,
        height: 359,
        child: ListView.builder(
          itemCount: calendars.data.length,
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                    _addEvent(calendars.data[index].id, titulo, descricao, dataInicio, hora, dataFim);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colors.backgroundDisabledColor,width: 1)
                    ),
                    child: Center(
                      child: CustomText(text: calendars.data[index].name)

                    )
                  ),
                ),
            );         
          }
        )
      ),
      confirmLabel: 'CANCELAR'
    );
  }

  static void _addEvent(String calendarId, String titulo, String descricao, String dataInicio, String hora, String dataFim) async {
    final dayInicio = dataInicio.substring(0,2);
    final monthInicio = dataInicio.substring(3,5);
    final yearInicio = dataInicio.substring(6,10);

    DateTime date = DateTime.parse('$yearInicio-$monthInicio-$dayInicio $hora:00');
    date = date.toLocal();

    DateTime endDate;
    DateTime startDate;

    if (dataInicio == null) {
      startDate = new DateTime.now();
      startDate.toLocal();
    } else {
      startDate = DateTime.parse('$yearInicio-$monthInicio-$dayInicio $hora:00');
      startDate.toLocal();
    }
    
    if (dataFim != null) {
      final dayFim = dataFim.substring(0,2);
      final monthFim = dataFim.substring(3,5);
      final yearFim = dataFim.substring(6,10);

      endDate = DateTime.parse('$yearFim-$monthFim-$dayFim $hora:00');
      endDate = endDate.toLocal();
    } else {
      endDate = date.add(new Duration(hours: 1));
    }

    final event = new Event(calendarId);

    event.title = titulo == null ? 'Título do evento' : titulo;
    event.description = descricao == null ? '' : descricao;
    event.start = startDate;
    event.end = endDate;

    await _deviceCalendarPlugin.createOrUpdateEvent(event);
    CustomToast.show("Adicionado com sucesso!");
  }
}

