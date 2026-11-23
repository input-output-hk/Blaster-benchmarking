import LiveScripts.Shared
import LiveScripts.S_3b3696ce7855cd638aab9d4199358817471af38297c9d88a7cd4dfec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3b3696ce7855cd638aab9d4199358817471af38297c9d88a7cd4dfec.script [ctx] 10000]
