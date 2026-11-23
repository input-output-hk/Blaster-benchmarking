import LiveScripts.Shared
import LiveScripts.S_0ea182d20d2dbc840939e730a25e62d8820a9503f60ac52b41e43f21.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0ea182d20d2dbc840939e730a25e62d8820a9503f60ac52b41e43f21.script [ctx] 10000]
