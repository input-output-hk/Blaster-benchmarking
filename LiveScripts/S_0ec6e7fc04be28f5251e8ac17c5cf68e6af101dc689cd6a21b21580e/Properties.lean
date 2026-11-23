import LiveScripts.Shared
import LiveScripts.S_0ec6e7fc04be28f5251e8ac17c5cf68e6af101dc689cd6a21b21580e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0ec6e7fc04be28f5251e8ac17c5cf68e6af101dc689cd6a21b21580e.script [ctx] 10000]
