import LiveScripts.Shared
import LiveScripts.S_2af0e5cf68e1ce0ac5470cfbed9dbfebe2f8f8def35f042b17199944.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2af0e5cf68e1ce0ac5470cfbed9dbfebe2f8f8def35f042b17199944.script [ctx] 10000]
