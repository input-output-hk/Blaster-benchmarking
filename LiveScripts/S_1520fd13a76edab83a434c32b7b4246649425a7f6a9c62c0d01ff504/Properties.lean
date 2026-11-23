import LiveScripts.Shared
import LiveScripts.S_1520fd13a76edab83a434c32b7b4246649425a7f6a9c62c0d01ff504.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1520fd13a76edab83a434c32b7b4246649425a7f6a9c62c0d01ff504.script [ctx] 10000]
