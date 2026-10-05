#include "test.h"
#include <Logging/log.h>

void say_core()
{
    KT_LOG(KT_LOG_COMPILE_TIME_LEVEL, "KotonoCoreTestExtension", "Core !");
}
