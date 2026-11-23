import LiveScripts.Shared
import LiveScripts.S_1dcc0fd142babcbd12f6d698997b9acbb02b12bde57cd03b74592d10.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1dcc0fd142babcbd12f6d698997b9acbb02b12bde57cd03b74592d10.script [ctx] 10000]
