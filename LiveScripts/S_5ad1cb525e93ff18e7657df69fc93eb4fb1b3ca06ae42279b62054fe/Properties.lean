import LiveScripts.Shared
import LiveScripts.S_5ad1cb525e93ff18e7657df69fc93eb4fb1b3ca06ae42279b62054fe.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5ad1cb525e93ff18e7657df69fc93eb4fb1b3ca06ae42279b62054fe.script [ctx] 10000]
