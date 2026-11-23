import LiveScripts.Shared
import LiveScripts.S_98a0471e0b612c712d49fcb37dd84cf7a61091d6d8157cbd42e2098b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_98a0471e0b612c712d49fcb37dd84cf7a61091d6d8157cbd42e2098b.script [ctx] 10000]
