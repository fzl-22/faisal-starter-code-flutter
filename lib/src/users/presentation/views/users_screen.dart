import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';
import 'package:faisal_starter_code_flutter/src/users/presentation/bloc/users_bloc.dart';
import 'package:faisal_starter_code_flutter/src/users/presentation/widgets/user_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  static const path = '/users';
  static const name = 'users';

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  Future<void> getUsers() async =>
      context.read<UsersBloc>().add(const GetUsersEvent());

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Users'),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (state is GettingUsers) {
                return _buildLoading(constraints: constraints);
              } else if (state is GetUsersError) {
                return _buildError(
                  message: state.message,
                  constraints: constraints,
                );
              } else if (state is UsersLoaded) {
                return _buildContent(
                  items: state.users,
                  constraints: constraints,
                );
              }

              return const SizedBox();
            },
          );
        },
      ),
    );
  }

  Widget _buildLoading({
    required BoxConstraints constraints,
  }) {
    return Container(
      constraints: BoxConstraints(
        minHeight: constraints.maxHeight,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildError({
    required String message,
    required BoxConstraints constraints,
  }) {
    return RefreshIndicator(
      onRefresh: getUsers,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Center(
              child: Text(message),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent({
    required List<User> items,
    required BoxConstraints constraints,
  }) {
    return RefreshIndicator(
      onRefresh: getUsers,
      child: items.isEmpty
          ? ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: const Center(
                    child: Text('Sorry, no data available...'),
                  ),
                ),
              ],
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final user = items[index];
                return UserItemTile(
                  onTap: () {
                    context.pop('${user.firstName} ${user.lastName}');
                  },
                  user: user,
                );
              },
            ),
    );
  }
}
