part of 'hisn_el_muslim_page.dart';

mixin _TasbihMixin3 on _DigitalTasbihPageState {
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        12,
        8,
        12,
        0,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          ),
          const Expanded(
            child: Text(
              'المسبحة الإلكترونية',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

}
