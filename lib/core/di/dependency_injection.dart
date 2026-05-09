import 'package:get_it/get_it.dart';
import 'package:ai_chat_bot/core/networking/api_service.dart';
import 'package:ai_chat_bot/core/networking/dio_factory.dart';
import 'package:ai_chat_bot/features/chat/data/repos/gemini_send_messages_repo_impl.dart';
import 'package:ai_chat_bot/features/chat/data/services/gemini_chat_service.dart';
import 'package:ai_chat_bot/features/chat/domain/repos/gemini_send_messages_repo.dart';
import 'package:ai_chat_bot/features/chat/presentation/cubit/gemini_send_messages_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Networking
  getIt.registerLazySingleton<ApiService>(() => ApiService(DioFactory.getDio()));

  // Services
  getIt.registerLazySingleton<GeminiChatService>(
    () => GeminiChatService(getIt<ApiService>()),
  );

  // Repositories
  getIt.registerLazySingleton<GeminiSendMessagesRepo>(
    () => GeminiSendMessagesRepoImpl(getIt<GeminiChatService>()),
  );

  // Cubits
  getIt.registerFactory<GeminiSendMessagesCubit>(
    () => GeminiSendMessagesCubit(getIt<GeminiSendMessagesRepo>()),
  );
}
