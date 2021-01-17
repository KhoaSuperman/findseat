import 'package:find_seat/model/db/db.dart';
import 'package:find_seat/model/entity/ticket.dart';

class TicketRepo {
  Future createTicket(Ticket ticket) async {
    return TicketDAO.insert(ticket);
  }

  Future<List<Ticket>> getAll() async {
    return TicketDAO.getAll();
  }
}
