import LiveScripts.Shared
import LiveScripts.S_77f65e4d14ed8106e8a97814bdb0e7688f652fe41c71295a42f11a26.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_77f65e4d14ed8106e8a97814bdb0e7688f652fe41c71295a42f11a26.script [ctx] 10000]
